# Maintainer: Maxwell G <gotmax@e.email>

_collection_namespace=kewlfft
_collection_name=aur
_repo_name=ansible-aur
_github_url="https://github.com/${_collection_namespace}/${_repo_name}"

pkgname="ansible-collection-${_collection_namespace}-${_collection_name}"
pkgver=0.11.1
pkgrel=1
pkgdesc="Ansible collection that contains an Ansible module to manage packages from the AUR"
arch=("any")
url="https://galaxy.ansible.com/${_collection_namespace}/${_collection_name}"
license=("GPL3")
depends=("ansible-core")
source=("${_github_url}/archive/v${pkgver}/${_repo_name}-${pkgver}.tar.gz")
sha256sums=('99e2b07a18881423b6433f4c08ef4caf4906a11fb7fcde67abd211bf10a9ded7')

build() {
    cd "${_repo_name}-${pkgver}"
    ansible-galaxy collection build
}

package() {
    cd "${_repo_name}-${pkgver}"
    ansible-galaxy collection install -n -p \
        "${pkgdir}/usr/share/ansible/collections" \
        "${_collection_namespace}-${_collection_name}-${pkgver}.tar.gz"
    install -Dpm 644 README.md -t "${pkgdir}/usr/share/docs/${pkgname}"
}
