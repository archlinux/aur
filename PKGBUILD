# Maintainer: Jeffrey Zhang <zhang.lei.fly@gmail.com>

pkgname=ansible-runner
pkgver=2.0.3
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
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/75/c7/147261ca82089f52f61ad6ddfe1a8a78704de196c4c9ba18902e9ddc6b88/ansible-runner-${pkgver}.tar.gz")
sha256sums=('8f6be6e2e3150f5ca56e5352ded0e4db6422bbedbd731f3bc15de6c09fa44096')

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
