# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>

pkgname=quake3-edawn
pkgver=1.4.1
pkgrel=2
pkgdesc="A Quake III Arena mod with numerous improvements"
arch=('any')
url="http://edawn-mod.org/"
license=('custom')
depends=('quake3')
source=("http://edawn-mod.org/binaries/edawn-${pkgver}-1.zip")
sha256sums=('a6a232f64fcfd3f6387d809b8a7912d6095b6dcd39cc6572407a54c96ab68a27')

package() {
  # Non-modified Quake 3 engines may have problems loading
  # files with unusual extensions
  cd edawn
  for f in maps/*.{add,set}; do
    mv "$f" "$f.cfg"
  done

  cd "${srcdir}"
  mkdir -p "${pkgdir}/opt/quake3"
  cp -a edawn "${pkgdir}/opt/quake3"

  install -D -m 0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
