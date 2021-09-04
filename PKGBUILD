# Maintainer: Maxwell G <gotmax@e.email>
_collection_namespace=kewlfft
_collection_name=aur
_repo_name=ansible-aur
_github_url="https://github.com/${_collection_namespace}/${_repo_name}"

pkgname="ansible-collection-${_collection_namespace}-${_collection_name}"
pkgver=0.9.1
pkgrel=2
pkgdesc="Ansible collection that contains an Ansible module to manage packages from the AUR"
arch=("any")
url="https://galaxy.ansible.com/${_collection_namespace}/${_collection_name}"
license=("GPL3")
depends=("ansible-core")
source=("${_github_url}/archive/v${pkgver}/${_repo_name}-${pkgver}.tar.gz")
sha256sums=('29ee274cc2e627b109deefc70984b3fcf617b3d14098cb61069e4b46eba08538')

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
