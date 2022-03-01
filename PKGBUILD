# Maintainer: J. Nathanael Philipp <nathanael@philipp.land>
pkgname=ledger
pkgver=2.0.2
pkgrel=1
pkgdesc="Web based ledger system to keep track of your money"
arch=("any")
url="https://github.com/jnphilipp/ledger"
license=("GPL3+")
makedepends=("git" "help2man" "python" "python-virtualenv")
depends=("python" "python-django" "python-gobject" "python-dbus" "systemd" "uwsgi" "uwsgi-plugin-python")
source=("git://github.com/jnphilipp/ledger.git"
        "git://github.com/jnphilipp/django_bootstrap5.git")
md5sums=(SKIP SKIP)

prepare() {
  cd "$srcdir/$pkgname"
  git submodule init
  git config submodule.django-bootstrap5.url $srcdir/django-bootstrap5
  git submodule update
}

package() {
    cd "$srcdir/$pkgname"
    git checkout $pkgver
    make clean
    make venv PYTHON_LIB_DIR=/usr/lib/python3.10/site-packages
    make test
    make install DEST_DIR=$pkgdir
}
