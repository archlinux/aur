# Maintainer: 0xbbuddha <killian@archimedeos.org>

pkgname=evil-winrm-py
pkgver=1.6.0
pkgrel=1
pkgdesc="WinRM shell for Windows and Active Directory pentesting"
arch=('any')
url="https://github.com/adityatelange/evil-winrm-py"
license=('MIT')
provides=('evil-winrm-py')
conflicts=('evil-winrm-py')
depends=('python' 'python-pypsrp' 'python-prompt_toolkit' 'python-tqdm')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-kerberos: Kerberos authentication support')
source=("evil_winrm_py-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/44/10/5731c231e9686663e081641f7be18be869464fecc662fe54358fad8e962f/evil_winrm_py-${pkgver}.tar.gz")
sha256sums=('042246af0651b7adb00e8f9fb0b0e2d966f73b85a21d5f1c92775d72fff457ea')

build() {
  cd "${srcdir}/evil_winrm_py-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/evil_winrm_py-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  if [[ -f LICENSE ]]; then
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}

