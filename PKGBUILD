# Maintainer: Narayan Lima da Silva <narayan.song@gmail.com>

pkgname=tac-writer
pkgdesc="Academic writing assistant using the Continuous Argumentation Technique (CAT)"
# Uncomment and edit the following lines as needed
depends=(
    'gtk4'
    'libadwaita'
    'python'
    'python-gobject'
    'python-reportlab'
    'python-gtkspellcheck'
    'python-pyenchant'
    'python-pillow'
    'python-requests'
    'gettext'
    'ttf-liberation'
    'python-pypdf'
    'hunspell-pt-br'
    'hunspell-en_us'
    'hunspell-es_any'
)
makedepends=('gettext')
optdepends=(
    'hunspell-bg: For Bulgarian spell checking'
    'hunspell-de: For German spell checking'
    'hunspell-el: For Greek spell checking'
    'hunspell-en_us: For US English spell checking'
    'hunspell-en_gb: For British English spell checking'
    'hunspell-en_ca: For Canadian English spell checking'
    'hunspell-es_es: For Spanish (Spain) spell checking'
    'hunspell-es_any: For Spanish (generic) spell checking'
    'hunspell-fr: For French spell checking'
    'hunspell-he: For Hebrew spell checking'
    'hunspell-hu: For Hungarian spell checking'
    'hunspell-it: For Italian spell checking'
    'hunspell-nl: For Dutch spell checking'
    'hunspell-pl: For Polish spell checking'
    'hunspell-pt-br: For Brazilian Portuguese spell checking'
    'hunspell-ro: For Romanian spell checking'
    'hunspell-ru: For Russian spell checking'
    'hunspell-sk: For Slovak spell checking'
)
conflicts=('comm-tac-writer')
provides=('comm-tac-writer')
replaces=('comm-tac-writer')
pkgver=$(date +%y.%m.%d)
pkgrel=$(date +%H%M)
arch=('any')
license=('MIT')
url="https://github.com/narayanls/${pkgname}"
source=("git+${url}.git")
md5sums=('SKIP')

# Automatically detect and use the correct install file
if [ -e "${pkgname}.install" ]; then
    install=${pkgname}.install
elif [ -e "pkgbuild.install" ]; then
    install=pkgbuild.install
fi

prepare() {
    cd "${srcdir}/${pkgname}"
    # Add any preparation steps here, if needed
    # For example: patch -p1 < "${srcdir}/patch-file.patch"
}

build() {
    cd "${srcdir}/${pkgname}"
    # Add build steps here, if needed
    # For example: make
}

check() {
    cd "${srcdir}/${pkgname}"
    # Add check/test steps here, if needed
    # For example: make check
}

package() {
    cd "${srcdir}/${pkgname}"

    # Determine the correct source directory
    if [ -d "${pkgname}" ]; then
        srcdir="${srcdir}/${pkgname}/${pkgname}"
    else
        srcdir="${srcdir}/${pkgname}"
    fi

    # Install files
    local dirs=("usr" "etc" "opt")
    for dir in "${dirs[@]}"; do
        if [ -d "${srcdir}/${dir}" ]; then
            cp -a "${srcdir}/${dir}" "${pkgdir}/"
        fi
    done

    # Install license file if present
    if [ -f "LICENSE" ]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi

    # Install documentation if present
    if [ -f "README.md" ]; then
        install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    fi
}
