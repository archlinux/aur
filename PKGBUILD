# Maintainer: Pablo Palazon <ppalazon@antara.ws>
pkgname=ecs-tasks-ops
pkgdesc="Ecs Tasks Ops - Manage ssh connections to ECS docker containers"
url="https://github.com/ppalazon/ecs-tasks-ops"
license=('MIT')
pkgver=0.3.2
pkgrel=1
arch=('x86_64')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a1da489bddaa11ed936a07e7b3a9aee3e1166160c7ebc4d1ad1ccabf773c9a6e')

depends=("python-click" "python-boto3" "python-tabulate" "python-moto" "python-sshpubkeys")

optdepends=("python-pyqt5: Qt5 gui application")

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
