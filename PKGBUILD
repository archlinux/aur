# Maintainer: James An <james@jamesan.ca>

pkgname=bash-utils-git
_pkgname=${pkgname%-git}
pkgver=0.1.r43.g75d877b
pkgrel=1
pkgdesc="Miscellaneous small utils, mainly for the Bash shell."
arch=('any')
url="https://github.com/jabbalaci/Bash-Utils"
license=('unknown')
depends=('python')
optdepends=(
    'markdown: for markdown.py'
    'python-beautifulsoup4: for get_images.py, get_links.py, and prettify.py'
)
makedepends=('git')
source=("$_pkgname"::"git+https://github.com/jabbalaci/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    (
        set -o pipefail
        git describe --long --tag | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "$_pkgname"

    # install the scripts
    install -dm755 "${pkgdir}/usr/lib/bash-utils"
    cp -R . "${pkgdir}/usr/lib/bash-utils"
    find "$pkgdir"                 -type d -exec chmod 0755 {} +
    find "$pkgdir"                 -type f -exec chmod 0644 {} +
    find "$pkgdir" -name '*.p[ly]' -type f -exec chmod 0755 {} +
    rm -rf "${pkgdir}/usr/lib/bash-utils/.git"

    install -dm755 "${pkgdir}/usr/bin"
    ln -st "${pkgdir}/usr/bin" \
        /usr/lib/bash-utils/alarm.py \
        /usr/lib/bash-utils/dictionary/dictionary.py \
        /usr/lib/bash-utils/dropbox/dropbox_permissions.py \
        /usr/lib/bash-utils/dropbox/get_public_link.py \
        /usr/lib/bash-utils/firefox/export_firefox_cookies.py \
        /usr/lib/bash-utils/get_images.py \
        /usr/lib/bash-utils/get_links.py \
        /usr/lib/bash-utils/img_to_base64.py \
        /usr/lib/bash-utils/markdown.py \
        /usr/lib/bash-utils/mouse/mousepos_gui.py \
        /usr/lib/bash-utils/open_in_tabs.py \
        /usr/lib/bash-utils/prettify.py \
        /usr/lib/bash-utils/py2rtf.py \
        /usr/lib/bash-utils/radio/radio.py \
        /usr/lib/bash-utils/reddit/reddit_get_posts.py \
        /usr/lib/bash-utils/redirect_to.py \
        /usr/lib/bash-utils/replace_accents/replace_french_accents_to_latex.pl \
        /usr/lib/bash-utils/replace_accents/replace_latex_accents.pl \
        /usr/lib/bash-utils/sp.py \
        /usr/lib/bash-utils/templates/alap.py \
        /usr/lib/bash-utils/tocb.py \
        /usr/lib/bash-utils/top10.py \
        /usr/lib/bash-utils/us.py
}


