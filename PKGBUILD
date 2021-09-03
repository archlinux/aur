# Maintainer: Maxwell G <gotmax@e.email>
_collection_namespace=kewlfft
_collection_name=aur
_repo_name=ansible-aur
_github_url="https://github.com/${_collection_namespace}/${_repo_name}"

pkgname="ansible-collection-${_collection_namespace}-${_collection_name}"
pkgver=0.9.0
pkgrel=1
pkgdesc="Ansible collection that contains an Ansible module to manage packages from the AUR"
arch=("any")
url="https://galaxy.ansible.com/${_collection_namespace}/{$_collection_name}"
license=("GPL3")
depends=("ansible-core")
source=("${_github_url}/archive/v${pkgver}/${_repo_name}-${pkgver}.tar.gz")
sha256sums=('4e3f51e8e0367b20c68a46158e3563f5a04243e820c817c51791990445b0ff87')

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
