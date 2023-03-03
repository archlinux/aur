# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-python-crontab
_name=python-crontab
pkgver=2.7.1
pkgrel=1
pkgdesc="Crontab module for reading and writing crontab files and accessing the system cron automatically and simply using a direct API."
arch=('any')
url="https://gitlab.com/doctormo/python-crontab"
license=('GPL3')
depends=('python-dateutil')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
optdepends=('cronie'
            'python-cron-descriptor: Ask for a translated string'
            'python-croniter: Run a cron tab as a daemon')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b21af4647c7bbb848fef2f020616c6b0289dcb9f94b4f991a55310ff9bec5749')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"

  # test_07_non_posix_shell - only for Windows
  pytest -k "not test_07_non_posix_shell"
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
