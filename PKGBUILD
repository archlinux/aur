# Maintainer: Pablo Palazon <ppalazon@antara.ws>
pkgname=ecs-tasks-ops
pkgdesc="Ecs Tasks Ops - Manage ssh connections to ECS docker containers"
url="https://github.com/ppalazon/ecs-tasks-ops"
license=('MIT')
pkgver=0.3.4
pkgrel=1
arch=('x86_64')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('53b000235e0fde72587ce9c7598be1a1d1f753ddd32ebe19032263f48f2ea238')

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
