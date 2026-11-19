# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Denommus <yuridenommus@gmail.com>
# Contributor: Bill Fraser <wfraser@codewise.org>
# Contributor: Felipe Contreras <felipe.contreras@gmail.com>

pkgname=lib32-flex
pkgver=2.6.15
pkgrel=1
pkgdesc='A tool for generating text-scanning programs'
arch=('x86_64')
#url='http://flex.sourceforge.net'
url='https://github.com/westes/flex'
license=('custom')
depends=("flex>=${pkgver}" 'lib32-glibc')
source=("https://github.com/westes/flex/releases/download/v${pkgver}/flex-${pkgver}.tar.gz")
sha256sums=('ba38801d12d38782e36f2ddd66c118aa9ed3cbed9849194c4e68d9894cd739d9')

build() {
  cd flex-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32'
  make
}

package() {
  cd flex-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share,bin}

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s flex "${pkgdir}"/usr/share/licenses/lib32-flex
}

# vim: ts=2 sw=2 et:
