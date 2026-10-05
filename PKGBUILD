# Maintainer: 0xbbuddha <killian@archimedeos.org>

pkgname=evil-winrm-py
pkgver=1.7.0
pkgrel=1
pkgdesc="WinRM shell for Windows and Active Directory pentesting"
arch=('any')
url="https://github.com/adityatelange/evil-winrm-py"
license=('MIT')
provides=('evil-winrm-py')
conflicts=('evil-winrm-py')
depends=('python' 'python-pypsrp' 'python-prompt_toolkit' 'python-tqdm')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-gssapi: Kerberos authentication support' 'python-krb5: Kerberos authentication support' 'python-mcp: MCP server support')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/evil_winrm_py-${pkgver}.tar.gz")
sha256sums=('cecbdd23bb0979db47aff57f5e30fa27944c1c750c2cf98b687b736debe8b7a2')

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

