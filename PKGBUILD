# Maintainer: Jerzy Mansarliński <jerzy at mansar dot eu>

pkgname=got-your-back
pkgver=1.97
pkgrel=1
pkgdesc="A command line tool for backing up Gmail messages. Known as GYB."
arch=(any)
url=https://github.com/GAM-team/got-your-back
license=(Apache-2.0)
depends=(
    'bash' 
    'python>=3.13' 
    'python-httplib2>=0.17.0' 
    'python-google-api-python-client>=2.0' 
    'python-google-auth>=1.11.2'
    'python-google-auth-httplib2'
    'python-google-auth-oauthlib>=0.4.1'
    'python-packaging>=25.0'
)
provides=(gyb)
conflicts=(python-gyb-git)
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    )
sha256sums=(
    '853050ff6e2dde4f71585c4256b730f7c50404f04ce083895634d91155fcb4a1'
    )

package () {
    echo "#!/bin/sh" > ./gyb
    echo "python /usr/lib/${pkgname}/gyb.py \"\$@\"" >> ./gyb 

    install -Dm755 ./gyb ${pkgdir}/usr/bin/gyb

    cd "${pkgname}-${pkgver}"
    find . -type f \( -name "*.py" -o -name "cacerts.pem" \) -not -path "./tools/hooks/*" -exec install -Dm644 {} "${pkgdir}/usr/lib/${pkgname}/{}" \;
}
