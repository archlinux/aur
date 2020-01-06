# Maintainer: Modelmat <modelmat@outlook.com.au>

pkgname=frc-characterization-git
pkgver=2020.229
pkgrel=1
pkgdesc="Tools to help FRC teams measure the physical parameters of their robot"
arch=("x86_64")
url="https://github.com/wpilibsuite/frc-characterization"
license=("Apache")
provides=("frc-characterization")
depends=("python-matplotlib"
         "python-statsmodels"
         "python-frccontrol-git"
         "python-pynetworktables"
         "python-argcomplete"
         "python-mako"
         "python-console-menu-git"
         "tk")
source=("$pkgname"::"git://github.com/wpilibsuite/frc-characterization")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/$pkgname"
  year=$(date +%Y)
  echo $year.$(git rev-list --count --after="master@{$(($year - 1))-01-01}" master)
}

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
