# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot net>

pkgname='wiki-monkey'
# Don't use "-" in pkgver
pkgver='5.5.1'
pkgrel=1
pkgdesc="Wiki Monkey - MediaWiki (ArchWiki-optimized) bot and editor-assistant user script (server-enabled version)."
arch=('any')
url="https://github.com/kynikos/wiki-monkey/wiki"
license=('GPL3')
# Keep in sync with setup.py's install_requires option and requirements.txt
depends=('python-configfile'
         'python-pyxdg'
         'python-flask-restinpeace' # implies 'python-flask-marshmallow', 'python-apispec' and 'python-apispec-webframeworks'
         'python-flask-cors'
         'python-flask-migrate' # implies 'python-flask-sqlalchemy'
         'python-marshmallow-sqlalchemy')
optdepends=("gunicorn: serve the application with a proper WSGI server instead of Flask's local development server"
            "python-pyopenssl: make Flask's local development server use ad-hoc SSL certificates instead of a permanent one")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('973cf796e1a4c3d765bc091197215c0e5b5a7bd60189c6d3e7ae796d090cbcbb')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
