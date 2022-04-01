# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Contributor: the NICOS contributors, MLZ

pkgname=nicos
pkgver=3.9
pkgrel=1
pkgdesc="NICOS, the Networked Instrument Control System of the MLZ"
arch=('x86_64')
url="https://nicos-controls.org/"
license=('GPL3')
groups=('nicos')
depends=(
  'python-setuptools'
  'python-pytango'
  'python-nicos-pyctl>=1.0'
  'python-scipy>=0.9'
  'python-numpy>=1.10.0'
  'python-pyzmq>=13.1.0'
  'python-rsa>=3.1.2'
  'python-ldap3>=2.0.0'
  'python-psutil>=2.0'
  'python-html2text'
  'python-lttb'
  'python-toml'
  # Dev
  'python-coverage>=3.4'
  'python-isort'
  'python-pylint>=2.1.0'
  'python-pytest>=4.6'
  'python-pytest-cov'
  'python-pytest-timeout>=1.3.1'
  'python-mock>=1.0'
  'python-yaml>=3.0'
  'python-sphinx'
  'rst2pdf'
  'yapf'
  'python-sphinx_rtd_theme'
  'python-pytest-randomly'
  'python-pyftpdlib'
  'python-sphinxcontrib-seqdiag'
  # Opt
  'python-pyserial>=2.5'
  'python-astropy'
  'python-nicos-quickyaml>=1.1.0'
  'python-docutils'
  'python-redbaron'
  'python-keyring'
  'python-keyrings-alt'
  'python-pycryptodome'
  'python-sshtunnel'
  'python-requests'
  'python-pillow'
  'python-markdown'
  'python-h5py'
  # Gui
  'python-pyqt5'
  'python-pyqt5-webengine'
  'python-qscintilla-qt5'
)
provides=('nicos')
conflicts=('nicos-git')
source=('git+https://forge.frm2.tum.de/review/frm2/nicos/nicos')
sha256sums=('SKIP')


prepare() {
  cd "$srcdir/$pkgname"
  git switch origin/release-${pkgver} -c release-${pkgver} || git switch release-${pkgver}
}

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
}

check() {
  cd "$srcdir/$pkgname"
  python setup.py check -mr
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root=$pkgdir/
}
