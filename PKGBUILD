# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname='buck'
pkgver='2018.03.26.01'
pkgrel=1
pkgdesc='A fast build system that encourages the creation of small, reusable modules over a variety of platforms and languages.'
arch=('any')
depends=('java-runtime-headless>=7' 'python2')
makedepends=('java-environment>=7' 'apache-ant')
optdepends=('watchman: prevent Buck from parsing all of your build files every time')
url='https://buckbuild.com'
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/facebook/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('110d92524cb573906b06416e7e908657ec0625720efa45f4035e7e15396002ec')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ant
  ./bin/buck build buck
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  BINPATH=$(./bin/buck targets --show_output buck | cut -d' ' -f2)
  install -Dm 755 "${BINPATH}" "${pkgdir}/usr/bin/buck"
}
