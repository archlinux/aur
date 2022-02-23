# Maintainer: Jeffrey Zhang <zhang.lei.fly@gmail.com>

pkgname=ansible-runner
pkgver=2.1.1
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
source=("https://files.pythonhosted.org/packages/49/cf/a3efd54be7edee2d4a9f5e497d54d7038707aa22120abdefd191106232a2/ansible-runner-${pkgver}.tar.gz")
sha256sums=('7684612f7543c5f07f3e8135667eeb22a9dbd98f625cc69901ba9924329ef24f')

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
