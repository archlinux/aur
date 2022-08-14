pkgname=datasette
pkgver=0.62
pkgrel=2
pkgdesc="An open source multi-tool for exploring and publishing data"
arch=("any")
url="https://datasette.io"
license=("Apache")
depends=("python-asgiref" "python-click" "python-click-default-group" "python-jinja" "python-hupper" "python-httpx" "python-pint"
"python-pluggy" "uvicorn" "python-aiofiles" "python-janus" "python-asgi-csrf" "python-yaml" "python-mergedeep"
"python-itsdangerous" "python-baseconv")
makedepends=("python-setuptools")
conflicts=("datasette")
source=("https://pypi.io/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("f719c9148970ed20f565b0a3d8461060fc3748674a1556d63afd058a06d136d5")

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    sed -i 's/click>=7.1.1,<8.1.0/click>=7.1.1,<8.2.0/' setup.py
    sed -i 's/Jinja2>=2.10.3,<3.1.0/Jinja2>=2.10.3,<3.2.0/' setup.py
    python setup.py install --root=${pkgdir} --optimize=1
    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
