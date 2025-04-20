# Maintainer: Jeffrey Zhang <zhang.lei.fly#gmail.com>

pkgname=ansible-runner
_pkgname=ansible_runner
pkgver=2.4.1
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
makedepends=('python-setuptools' 'python-pbr' 'git' 'python-wheel' 'python-pip' 'python-build')
source=("https://files.pythonhosted.org/packages/06/89/9426e3353829ab0c2f0277a14a6bc4d99d301b74533b0c901e7636794e45/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('11d717da4dd8d93d56703a4a98e5f2154026a7ed1b46d9930902b8298dc67d09')

build() {
    cd ${_pkgname}-${pkgver}
    python -m build
}

package() {
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

    cd ${_pkgname}-${pkgver}
    python -m pip install --root="$pkgdir" .
    rm -rf "${pkgdir}${site_packages}/test"
    install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
