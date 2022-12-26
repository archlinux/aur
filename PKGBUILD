# Maintainer: olddog <jeff@impcode.com>
# Contributer: Maxwell G <gotmax@e.email>

_collection_namespace=community
_collection_name=general
_repo_name="${_collection_namespace}.${_collection_name}"
_github_url="https://github.com/ansible-collections/${_repo_name}"

pkgname="ansible-collection-${_collection_namespace}-${_collection_name}"
pkgver=6.1.0
pkgrel=1
pkgdesc="Ansible Galaxy Community General Collection"
arch=("any")
url="https://galaxy.ansible.com/${_collection_namespace}/${_collection_name}"
license=("GPL3")
depends=("ansible-core")
source=("${_github_url}/archive/${pkgver}/${_repo_name}-${pkgver}.tar.gz")
sha256sums=('b034bfc38b9b039341ea0cac89fa5caf96b765e252b3ec59e213d9cd02734e38')

build() {
    cd "${_repo_name}-${pkgver}"
    ansible-galaxy collection build
}

package() {
    cd "${_repo_name}-${pkgver}"
    ansible-galaxy collection install -n -p \
        "${pkgdir}/usr/share/ansible/collections" \
        "${_collection_namespace}-${_collection_name}-${pkgver}.tar.gz"
}
