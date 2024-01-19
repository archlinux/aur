# Maintainer: Alexander Jacocks <alexander@redhat.com>

pkgname=ansible-navigator
pkgver=3.6.0
pkgrel=1
pkgdesc="A text-based user interface (TUI) for Ansible."
arch=('any')
url="https://github.com/ansible/ansible-navigator"
license=('MIT')
depends=(python python-{jsonschema,onigurumacffi} ansible-{core,runner} podman)
makedepends=(python-{build,installer,setuptools,wheel,setuptools-scm,setuptools-scm-git-archive})
checkdepends=('python-pytest')
optdepends=('ansible: check official ansible collections')
provides=('ansible-navigator')
conflicts=('ansible-navigator')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/65/f3/506b103d33e0ae9b0e18ae7937648b587869a222ce833217af96f86a837b/ansible-navigator-3.6.0.tar.gz")
sha256sums=('889dd1e8c8bc0c352435107c54ecd2fa1e3ec2a31cf910330498810e2cd3d352')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" ${srcdir}/${pkgname}-${pkgver}/dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}

