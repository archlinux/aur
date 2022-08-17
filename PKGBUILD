# Maintainer: Thibaud Kehler <thibaud dot kehler at gmx dot net>

pkgname=python-powerhub-git
pkgver=1.11.r3.gcc6428e
pkgrel=1
pkgdesc="A post exploitation tool for PowerShell to help transferring data and code."
arch=('any')
url="https://github.com/AdrianVollmer/PowerHub"
license=('MIT')
depends=('python' 
         'python-cheroot' 
         'python-cryptography' 
         'python-flask' 
         'python-flask-socketio' 
         'python-flask-sqlalchemy'
         'python-magic'
         'python-pyopenssl' 
         'python-pypykatz' 
         'python-service-identity' 
         'python-twisted' 
         'python-watchdog'
         'python-werkzeug'
         'python-wsgidav')
optdepends=('mingw-w64: Cross compilation of C/C++ payloads'
            'mono: Cross compilation of C# payloads')
makedepends=('git' 'python-setuptools') 
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('python-powerhub::git+https://github.com/AdrianVollmer/PowerHub.git')
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
    python setup.py build	
}

package() {
	cd "$srcdir/${pkgname%-git}"
    python setup.py install --root="$pkgdir" --optimize=1
}
