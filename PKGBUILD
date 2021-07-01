pkgname=datasette
pkgver=0.57.1
pkgrel=1
pkgdesc="An open source multi-tool for exploring and publishing data"
arch=("any")
url="https://datasette.io"
license=("Apache")
depends=("python-asgiref" "python-click" "python-click-default-group" "python-jinja" "python-hupper" "python-httpx" "python-pint"
"python-pluggy" "uvicorn" "python-aiofiles" "python-janus" "python-asgi-csrf" "python-yaml" "python-mergedeep"
"python-itsdangerous" "python-baseconv")
makedepends=("python-setuptools")
conflicts=("datasette")
source=("https://pypi.io/packages/source/d/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("f6186329bcbaa89bfd25a99034303fbac57f6248d077ec62ed21782b80622045")

build() {
    cd "${pkgname}-${pkgver}"
    sed -i 's/asgiref>=3.2.10,<3.4.0/asgiref>=3.2.10,<3.5.0/' setup.py
    python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1
    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
