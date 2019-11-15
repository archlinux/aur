# Maintainer: Payson Wallach <payson@paysonwallach.com>

pkgname=aw-server
pkgver=0.8.3
pkgrel=1
pkgdesc="Log what you do on your computer. Simple, extensible, no third parties."
arch=('i686' 'x86_64')
url="https://github.com/ActivityWatch/activitywatch"
license=('MPL2')
depends=('python>=3.5.1' 'python-aniso8601' 'python-appdirs' 'python-attrs' 'python-click' 'python-flask-cors' 'python-flask-restplus' 'python-flask' 'python-itsdangerous' 'python-markupsafe' 'python-jsonschema' 'python-json-logger' 'python-pyrsistent' 'python-pytz' 'python-werkzeug')
makedepends=('python>=3.5.1' 'python-setuptools')
source=("git+https://github.com/ActivityWatch/aw-server.git#commit=f43ea51")
md5sums=('SKIP')

prepare() {
    cd $pkgname
    git submodule update --init --recursive
    sed -i 's/\(^git+[^ <]*\)\(.*\)//' requirements.txt
    sed -i 's/=.*//' requirements.txt
}

build() {
    cd $pkgname
    make aw_webui
    python setup.py build
}

package() {
    cd $pkgname
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}
