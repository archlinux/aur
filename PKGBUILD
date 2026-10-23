# Maintainer: Marco Righi <marco.righi@cnr.it>

pkgname=sendemail-safe
pkgver=1.1.0
pkgrel=1
pkgdesc="Secure CLI email sending via SMTP and Gmail API OAuth 2.0"
arch=('any')
url="https://github.com/marcorighi/sendEmail-safe"
license=('MIT')
depends=('bash' 'python')
optdepends=('xdg-utils: opens the browser for initial Gmail OAuth authorization')

# Immutable upstream 1.1.0 source snapshot; avoids reliance on a missing tag.
_commit=71162095ac38bfede1f9fb6b19ec395a6ae012f0
source=(
    "${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/marcorighi/sendEmail-safe/tar.gz/${_commit}"
)
sha256sums=('3420281abcb0d92da1aedf7f70c778043189a1906e4259a92b8997b570c08a34')

check() {
    cd "${srcdir}/sendEmail-safe-${_commit}"

    ./run-tests.sh
}

package() {
    cd "${srcdir}/sendEmail-safe-${_commit}"

    install -Dm755 \
        sendEmail-safe.py \
        "${pkgdir}/usr/bin/sendEmail-safe.py"

    install -Dm755 \
        sendEmail-safe-configure.py \
        "${pkgdir}/usr/bin/sendEmail-safe-configure.py"

    install -Dm755 \
        sendEmail-safe-migrate.py \
        "${pkgdir}/usr/bin/sendEmail-safe-migrate.py"

    install -Dm755 \
        sendEmail-safe-google-auth.py \
        "${pkgdir}/usr/bin/sendEmail-safe-google-auth.py"

    # Imported by /usr/bin/sendEmail-safe.py; must be in the same directory.
    install -Dm644 \
        sendemail_safe_google.py \
        "${pkgdir}/usr/bin/sendemail_safe_google.py"

    install -Dm644 \
        README.md \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 \
        sendEmail-safe-README.txt \
        "${pkgdir}/usr/share/doc/${pkgname}/sendEmail-safe-README.txt"

    install -Dm644 \
        CHANGELOG.md \
        "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

    install -Dm644 \
        SECURITY.md \
        "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"

    install -Dm644 \
        sendemail-safe-profile.schema.json \
        "${pkgdir}/usr/share/${pkgname}/sendemail-safe-profile.schema.json"

    install -Dm644 \
        LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
