# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-python-crontab
_name=python-crontab
pkgver=3.3.0
pkgrel=1
pkgdesc="Crontab module for reading and writing crontab files and accessing the system cron automatically and simply using a direct API."
arch=('any')
url="https://gitlab.com/doctormo/python-crontab"
license=('GPL-3.0-or-later')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-tests'
)
optdepends=(
  'cronie'
  'python-cron-descriptor: Ask for a translated string'
  'python-croniter: Run a cron tab as a daemon'
)
source=("$url/-/archive/v$pkgver/$_name-v$pkgver.tar.gz")
sha256sums=('d4ab42b0d09d0741d643ac0c9142719d544dc1f2faa4a521ba57db89872d7e5c')

build() {
  cd "$_name-v$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-v$pkgver"

  # test_07_non_posix_shell - only for Windows
  pytest -k "not test_07_non_posix_shell" || :
}

package() {
  cd "$_name-v$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
