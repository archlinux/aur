# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: An Nguyen (stk) <an@linux.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=evolus-pencil-devel-git
pkgver=r1540.043ca48
pkgrel=1
epoch=1
pkgdesc="An open-source GUI prototyping tool - Development branch, GitHub"
arch=(any)
url="http://pencil.evolus.vn/"
license=(GPL2)
depends=(electron)
makedepends=(git npm)
provides=(pencil evolus-pencil)
conflicts=(pencil evolus-pencil)
source=("git+https://github.com/evolus/pencil.git#branch=development"
        "pencil.desktop"
        "pencil.sh")
sha256sums=('SKIP'
            '05f5f16d50d086599df73f3cb1b56f19489d32be839bf72238c2f1e0172e0693'
            'a69665c78aa0bb18212ae836dc40c5861c29c49e4eb02a97111a4040419dffd7')

pkgver() {
  cd "${srcdir}/pencil"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/pencil"
  npm install --cache "${SRCDEST}/npm-cache"
}

package() {
  cd "${srcdir}/pencil"

  install -d -m755 "${pkgdir}/usr/lib"
  cp -r app "${pkgdir}/usr/lib/pencil"

  install -D -m755 "${srcdir}/pencil.sh" "${pkgdir}/usr/bin/pencil"
  install -D -m644 "${srcdir}/pencil.desktop" "${pkgdir}/usr/share/applications/pencil.desktop"
  for ICON in build/icons/* ; do
    install -D -m644 "$ICON" \
      "${pkgdir}"/usr/share/icons/hicolor/`basename $ICON .png`/apps/pencil.png
  done
}

