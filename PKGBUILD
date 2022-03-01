# Maintainer: Zhang Hua <zhanghuadedn@gmail.com>
# Contributer: Aloxaf <aloxafx@gmail.com>

pkgname=python-playwright-git
pkgver=1.19.0.6.g14b56cf
pkgrel=1
pkgdesc="a Python library to automate Chromium, Firefox and WebKit browsers with a single API"
arch=(x86_64)
url=https://github.com/microsoft/playwright-python
license=(Apache)
provides=(python-playwright)
makedepends=('python-pip' 'python-wheel' 'git' 'curl')
depends=('python' 'python-greenlet' 'python-pyee' 'python-typing_extensions')
source=(${pkgname}::git+${url})
sha256sums=('SKIP')
pkgver() {
  cd ${srcdir}/${pkgname}
  git describe --tags | sed "s/-/./g;s/v//"
}
package() {
  cd ${srcdir}/${pkgname}
  pip install --isolated --root="$pkgdir" --ignore-installed --no-deps --no-warn-script-location "${srcdir}/${pkgname}"
  python -O -m compileall "${pkgdir}"
}
