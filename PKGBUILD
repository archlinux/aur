# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgbase=mcp-handley-lab
pkgname=mcp-handley-lab-git
pkgver=r150.1c36599
pkgrel=1
pkgdesc="Comprehensive MCP framework for Handley Research Group - productivity tools, scientific computing, and lab administration"
arch=(any)
url="https://github.com/handley-lab/mcp-handley-lab"
license=(MIT)
depends=(
    python
    python-mcp
    python-pydantic
    python-pydantic-settings
    python-google-api-python-client
    python-google-auth-httplib2
    python-google-auth-oauthlib
    python-google-genai
    python-googlemaps
    python-openai
    python-anthropic
    python-pillow
    python-httpx
    python-packaging
    python-yaml
    python-ruamel-yaml
    python-tinydb
    python-jmespath
    python-watchdog
    python-click
    python-html2text
    python-beautifulsoup4
    python-markdownify
    python-pendulum
    python-dateparser
    python-ftfy
    python-inscriptis
    python-selectolax
)
makedepends=(git python-build python-installer python-setuptools python-wheel)
optdepends=(
    'code2prompt: Codebase analysis'
    'vim: Text editing'
    'mutt: Email client'
    'notmuch: Email indexing'
    'msmtp: Email sending'
    'offlineimap: Email syncing'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
