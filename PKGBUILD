# Maintainer: Charles Leclerc <charles@la-mouette.net>

_collection_namespace=community
_collection_name=general
_repo_name="${_collection_namespace}.${_collection_name}"
_github_url="https://github.com/ansible-collections/${_repo_name}"

pkgname="ansible-collection-${_collection_namespace}-${_collection_name}"
pkgver=14.0.1
pkgrel=1
pkgdesc="Ansible Galaxy Community General Collection"
arch=("any")
url="https://github.com/ansible-collections/${_collection_namespace}.${_collection_name}"
license=("GPL3")
depends=("ansible-core")
source=("${_github_url}/archive/${pkgver}/${_repo_name}-${pkgver}.tar.gz")
sha256sums=('5ff096a67a7b10ad022672d50099266816457bbc05d5e6a251abb474143c582e')

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
