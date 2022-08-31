# Maintainer: Pablo Palazon <ppalazon@antara.ws>
pkgname="ecs-tasks-ops"
pkgdesc="Ecs Tasks Ops - Manage ssh connections to ECS docker containers"
url="https://github.com/ppalazon/ecs-tasks-ops"
license=('MIT')
pkgver=0.7.1
pkgrel=1
arch=('x86_64')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('74599826e2fa4bbf2d26176af30d08499bc7e38a2df9cc5ed0768405dbd85209')

#source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
#sha256sums=('a0c804e76b86f27797d0387a7e380e64ecf51f059a23199b8090267aa3191c96')

depends=("python-click" "python-boto3" "python-tabulate" "python-moto" "python-sshpubkeys")

optdepends=("python-pyqt5: Qt5 gui application" "rxvt-unicode: Display embedded terminal for ssh")

makedepends=("python-build" "python-installer" "python-wheel")

# prepare() {
#     cd "$pkgname-$pkgver"
#     dephell deps convert --from pyproject.toml --to setup.py
# }

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
