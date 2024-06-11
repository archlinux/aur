# Maintainer: Jeffrey Zhang <zhang.lei.fly#gmail.com>

pkgname=ansible-runner
pkgver=2.4.0
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
makedepends=('python-setuptools' 'python-pbr' 'git' 'python-wheel')
source=("https://files.pythonhosted.org/packages/e0/b4/842698d5c17b3cae7948df4c812e01f4199dfb9f35b1c0bb51cf2fe5c246/ansible-runner-${pkgver}.tar.gz")
sha256sums=('82d02b2548830f37a53517b65c823c4af371069406c7d213b5c9041d45e0c5b6')

build() {
    cd ${pkgname}-${pkgver}
    python -m build
}

package() {
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

    cd ${pkgname}-${pkgver}
    python -m pip install --root="$pkgdir" .
    rm -rf "${pkgdir}${site_packages}/test"
    install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
