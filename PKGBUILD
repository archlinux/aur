# Maintainer: Octopus118 <idlansdowne at gmail dot com>

pkgname=python-modern-robotics
_name=modern_robotics
pkgver=1.1.1
pkgrel=1
pkgdesc="Modern Robotics: Mechanics, Planning, and Control Code Library"
url="https://github.com/chmarti1/PYroMat"
arch=('any')
license=('GPL-3.0-only')
depends=('python-numpy')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')

source=("git+https://github.com/NxRLab/ModernRobotics.git#tag=v$pkgver")
sha256sums=('c12c84f8725aea14a5220e9cb08e19f747a7e67125e6b197de6b10eabe65f2b2')

build() {
    cat << EOF > "$srcdir/ModernRobotics/packages/Python/$_name/__version__.py"

__version__ = '$pkgver'
EOF
    python -m build -wno "$srcdir" "$srcdir/ModernRobotics/packages/Python"
}

package() {
    # Version 1.1.0 contains the wrong version number
    python -m installer -d "$pkgdir" "$srcdir/$_name-$pkgver-py3-none-any.whl"
}
