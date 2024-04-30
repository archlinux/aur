# Maintainer: Charles Leclerc <charles@la-mouette.net>

_collection_namespace=community
_collection_name=general
_repo_name="${_collection_namespace}.${_collection_name}"
_github_url="https://github.com/ansible-collections/${_repo_name}"

pkgname="ansible-collection-${_collection_namespace}-${_collection_name}"
pkgver=8.6.0
pkgrel=1
pkgdesc="Ansible Galaxy Community General Collection"
arch=("any")
url="https://github.com/ansible-collections/${_collection_namespace}.${_collection_name}"
license=("GPL3")
depends=("ansible-core")
source=("${_github_url}/archive/${pkgver}/${_repo_name}-${pkgver}.tar.gz")
sha256sums=('5dcf98d5930d20f147696758a57480bad6558e69d6d764e07b7649b37902b657')

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
