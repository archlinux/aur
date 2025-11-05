# Maintainer: Kaleb <vitor.guttler@edu.pucrs.br>
pkgname=terraform-local
pkgver=0.24.1
pkgrel=2
pkgdesc="Thin wrapper script to run Terraform against LocalStack"
arch=('any')
url="https://github.com/localstack/terraform-local"
license=('Apache-2.0')
depends=('python' 'python-localstack-client' 'python-hcl2' 'python-packaging')
optdepends=('terraform: to run terraform commands')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/06/8a/61237cd8b95d41f2e997fee78f1a05fd3f5e65845cfe7aae9362a9d28022/terraform_local-$pkgver.tar.gz")
sha256sums=('2cfaeb283a1753083f3f59be1a2e08d225286913633694d695b04bba9913ae91')

build() {
    cd "terraform_local-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "terraform_local-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
