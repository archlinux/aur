# Maintainer: bretello <bretello@distruzione.org>
pkgname=bretellofier
pkgver=0.8.0
pkgrel=2
pkgdesc="Command line telegram notifier"
arch=(any)
url="https://git.decapod.one/brethil/bretellofier"
license=('dowhateverthefuckyouwant')
depends=(python python-requests)
makedepends=(python-build python-setuptools-scm python-installer)
source=("git+https://git.decapod.one/brethil/bretellofier")
sha256sums=(SKIP)


prepare() {
  # Do a sanity check in the environment of the builder so the build process doesn't place files into a wrong directory.
  if [[ -n $VIRTUAL_ENV ]]; then
    echo "It seems a virtualenv is enabled. Please deactivate it before building this package."
    return 1
  fi
}

pkgver() {
    cd "$pkgname"
    python -m setuptools_scm
}

build() {
    cd "$pkgname"
    python -m build --no-isolation --wheel
}

package() {
    cd "$pkgname"
	python -m installer --destdir "$pkgdir" dist/*.whl
}


post_install() {
    echo "Run \"bretellofier --generate-config > ~/.bretellofier.conf\" to generate a sample config."
    echo "Replace token and name lines with your bot's token and telegram id"
    echo "Command line flags/environment variables can also be used. See bretellofier --help".
}
