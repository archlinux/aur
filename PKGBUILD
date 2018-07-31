# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Maintainer: Karol Babioch <karol@babioch.de>

pkgname=ansible-container
pkgver=0.9.2
pkgrel=2
pkgdesc="Ansible Container is a tool to build Docker images and orchestrate containers using only Ansible playbooks"
arch=('any')
url="https://github.com/ansible/ansible-container"
license=('GPL')
depends=('python-structlog' 'python-six' 'python-jinja' 'python-ruamel-yaml' 'python-pip' 'python-requests' 'python-yaml')
optdepends=('python-docker: building docker containers')
#checkdepends=('ansible' 'python-pytest' 'docker' 'python-jmespath')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ansible/ansible-container/archive/release-$pkgver.tar.gz"
        "fix-pip.patch")
sha256sums=('9213b4a503c226c56e9f5adf5d78770ed7e3a8259aa5d001e8e1cc6b91126802'
            'fce02ed8dea2662529a9fb780a4b9b6700dca1d61d08194bc53ae043193f9516')

prepare() {
  cd "$pkgname-release-$pkgver"
  patch -Np1 -i "${srcdir}/fix-pip.patch"
}

package() {
  cd "$pkgname-release-$pkgver"
  python setup.py install --root="${pkgdir}"
}

#check() {
# cd "$srcdir/$_gitname"
# pytest
#}
