# Maintainer: Jeffrey Zhang <zhang.lei.fly#gmail.com>

pkgname=ansible-runner
pkgver=2.3.5
pkgrel=1
pkgdesc="A tool and python library that helps when interfacing with Ansible directly"
arch=("any")
url="https://github.com/ansible/ansible-runner"
license=('Apache')
depends=("python-psutil"
         "python-pexpect"
         "python-daemon"
         "python-yaml"
         "python-six")
makedepends=('python-setuptools' 'python-pbr')
source=("https://files.pythonhosted.org/packages/e8/c7/c5f3fb32de173ff821554ead3deeeb8ac79b2874fc716341771fc53580da/ansible-runner-${pkgver}.tar.gz")
sha256sums=('cd9ddd5765870ea3c545b6cb47aaad5f04d9a30a628dd3fcdb4f367a28c22085')

build() {
    cd ${pkgname}-${pkgver}
    python setup.py build
}

package() {
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

    cd ${pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    rm -rf "${pkgdir}${site_packages}/test"
    install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
