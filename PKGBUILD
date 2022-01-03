# Maintainer: Maxwell G <gotmax@e.email>

_collection_namespace=community
_collection_name=general
_repo_name="${_collection_namespace}.${_collection_name}"
_github_url="https://github.com/ansible-collections/${_repo_name}"

pkgname="ansible-collection-${_collection_namespace}-${_collection_name}"
pkgver=4.2.0
pkgrel=1
pkgdesc="Ansible Community General Collection"
arch=("any")
url="https://galaxy.ansible.com/${_collection_namespace}/${_collection_name}"
license=("GPL3")
depends=("ansible-core")
source=("${_github_url}/archive/${pkgver}/${_repo_name}-${pkgver}.tar.gz")
sha256sums=('30629ce406cddfc195c9aa744579577b97c20588a282d87058a4fd9edf647bd0')

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
