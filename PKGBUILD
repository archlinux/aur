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
source=("https://github.com/ansible/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('304884b7f08e1e92e951c423144587cac93a3319e7d8fbbe552140e3a84239d9')

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
