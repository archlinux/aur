# Maintainer: Denis Alevi <mail at denisalevi dot de>

pkgname=dpt-rp1-py-git
_name=${pkgname%-git}
pkgver=0.1.0r72.9d7aec5
pkgrel=1
pkgdesc='Python package to manage a Sony DPT-RP1'
url='https://github.com/janten/dpt-rp1-py'
arch=('any')
license=('MIT')
depends=('python-httpsig' 'python-requests' 'python-pbkdf2' 'python-urllib3')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/janten/${_name}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  _version=$(awk -F'"' '/"version"/ {print $4}' setup.json)
  printf "%sr%s.%s" "$_version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_name}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}"
  python setup.py install --optimize=1 --root="${pkgdir}" --skip-build
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set sw=2 sts=2 et:
