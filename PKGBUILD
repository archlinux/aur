# PKGBUILD for user-last-login-tool-git (AUR)
# -----------------------------------------------------------------------------

pkgname=user-last-login-tool
pkgver=1.0.0
pkgrel=1
pkgdesc="Generates a CSV report detailing the last login time for system users (SRE tool)."
arch=('any')
url="https://github.com/DanLinX2004X/${pkgname}"
license=('MIT')
depends=('bash' 'shadow' 'util-linux')
# Source location (tarball from your GitHub repository tag)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a0a6d4bc71cd4e6625dfe0e31c1e13a2bb7dfa404085e6bfaa6809ac0ca97434')

# -----------------------------------------------------------------------------
# build()
# -----------------------------------------------------------------------------
# For a pure Bash script, the build step is typically not needed.
# This section is reserved for compilation or pre-installation checks.
build() {
    cd "${pkgname}-${pkgver}"
    # Optionally run tests before packaging
    # make test
}

# -----------------------------------------------------------------------------
# package() - The crucial installation step
# -----------------------------------------------------------------------------
package() {
    cd "${pkgname}-${pkgver}"

    # Arch Linux standard dictates installation into /usr/bin and /usr/share/man/man1.
    # We use the 'install' utility to copy and set permissions directly into $pkgdir.

    # 1. Install the executable script with appropriate permissions (755)
    # The -D flag creates all parent directories and sets permissions.
    install -Dm755 user_last_login.sh "${pkgdir}/usr/bin/user_last_login.sh"

    # 2. Install the man page with read permissions (644)
    install -Dm644 user_last_login.1 "${pkgdir}/usr/share/man/man1/user_last_login.1"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # NOTE: We do NOT create /opt/sre-reports/ or /var/log/sre-tools/ here.
    # The script itself handles directory creation on first run.
}
