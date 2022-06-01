# Maintainer: Pablo Palazon <ppalazon@antara.ws>
pkgname=ecs-tasks-ops
pkgdesc="Ecs Tasks Ops - Manage ssh connections to ECS docker containers"
url="https://github.com/ppalazon/ecs-tasks-ops"
license=('MIT')
pkgver=0.5.0
pkgrel=1
arch=('x86_64')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b9909a5698c285e27a1da66aeb531611f90bc03ed52e7f73683c222eee1ee7a8')

depends=("python-click" "python-boto3" "python-tabulate" "python-moto" "python-sshpubkeys")

optdepends=("python-pyqt5: Qt5 gui application" "rxvt-unicode: Display embedded terminal for ssh")

makedepends=("python-setuptools" "python-dephell")

prepare() {
    cd "$pkgname-$pkgver"
    dephell deps convert --from pyproject.toml --to setup.py
}

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
