# Maintainer: Kaleb <vitor.guttler@edu.pucrs.br>
pkgname=terraform-local
pkgver=0.26.0
pkgrel=1
pkgdesc="Thin wrapper script to run Terraform against LocalStack"
arch=('any')
url="https://github.com/localstack/terraform-local"
license=('Apache-2.0')
depends=('python' 'python-localstack-client' 'python-hcl2' 'python-packaging')
optdepends=('terraform: to run terraform commands')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/b9/f7/7d128b483dfd03d178c37eedc8c9329d7ee0abc4781bcfe5a0069ee63d79/terraform_local-$pkgver.tar.gz")
sha256sums=('958abac78c40b15fca6edcd833a9706a28e1cc861cb713e3fed5def345d518b8')

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
