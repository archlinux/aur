# Maintainer: dongdigua <dongdigua砹outlook碘com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=w3m-gemini
_gitcommit=edc602651c506aeeb60544b55534dd1722a340d3
_pkgver=0.5.3.git20230713-1
pkgver=${_pkgver/-/_}
pkgrel=1
pkgdesc='w3m with gemini support'
url='https://salsa.debian.org/debian/w3m'
license=('custom')
arch=('x86_64')
makedepends=('git' 'imlib2')
optdepends=('imlib2: for graphics support')
depends=('openssl' 'gc' 'ncurses' 'gpm')
source=("git+https://salsa.debian.org/debian/w3m.git#commit=${_gitcommit}" 'gemini.patch')
sha256sums=('SKIP' '43a5711390b22b80533a915a9aade18301781430e4d0cceea8f88df989a89d2a')

# There's also the maintainer's github repo, usually in sync with Debian's:
# https://github.com/tats/w3m

build() {
  cd w3m
  patch -p1 < ${srcdir}/gemini.patch
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --enable-image=x11,fb \
    --with-imagelib=imlib2 \
    --with-termlib=ncurses \
    --disable-w3mmailer \

  make
}

package() {
  cd w3m
  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}"/usr/share/{doc,licenses}/w3m
  install -m644 doc/* "${pkgdir}/usr/share/doc/w3m"
  ln -s ../../doc/w3m/README "${pkgdir}/usr/share/licenses/w3m"
}
