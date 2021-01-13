# Contributor: Vryali <vryali ~at~ gmail ~dot~ com>

pkgname='boxcryptor'
pkgfilename="Boxcryptor_Portable_Linux64"
#pkgver='2.31.296'
pkgver='2.33.304'
pkgrel='2'
pkgdesc="Boxcryptor Portable Client for Linux"
url="https://www.boxcryptor.com/l/download-linux-portable"
license=('custom')
arch=('x86_64')
depends=('bash')
# Could remove the packaged java and use existing but simpler to leave it alone for now.
# If someone else cleans this up leave me a comment

source=("${url}"
    "boxcryptor.desktop"
    "boxcryptor.svg"
    "boxcryptor.sh")
sha256sums=('91a27c5e38ef31cec975561095f7532dc9ff44f44cd0d6ec853a2eb8f5bf8527'
            '4bb5c3f0628ba30c8ffb3461dd1619799bb27db298ea682db96e787dc7705052'
            '771c399be357bedc1dc29c804063c30d2036e7d82cf4efeb7d8a3d32ebbbd0d6'
            '83f932018e189cd5250ead65de223f98c90bfafc99ea3e2de440c5370407e9ee')

package() {
    # Prepare system folders
    install -dm755 "${pkgdir}/usr/share/${pkgname}"     \
                  "${pkgdir}/usr/share/applications"    \
                  "${pkgdir}/usr/bin"

    # Add extra packages for ease of use
    install -Dm644 "${srcdir}/${pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

    # Note - you can definitely just remove everything under runtime and write a fresh launcher
    # and add java as a depends.  Not knowing how much this actually changes I'm leaving that
    # alone for now and just leaving the package with bloat.
    # If someone wants to clean this up and post it in the comments I can merge it in and update
    # the package release number according + provide credit :)
    mv "${srcdir}/boxcryptor.desktop" "${pkgdir}/usr/share/applications/"
    mv "${srcdir}/boxcryptor.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
    # Had issues with * so just doing the three of them...
    mv "${srcdir}/Boxcryptor/app" "${pkgdir}/usr/share/${pkgname}/"
    mv "${srcdir}/Boxcryptor/exec" "${pkgdir}/usr/share/${pkgname}/"
    mv "${srcdir}/Boxcryptor/runtime" "${pkgdir}/usr/share/${pkgname}/"
    # Have to edit the launcher courtesy of me not wanting capitals in the pkgname...
    sed 's/\(^cd\ .*\)Boxcryptor\/\(.*$\)/\1\2/g' "${srcdir}/Boxcryptor_Portable.sh" > "${pkgdir}/usr/share/${pkgname}/Boxcryptor_Portable.sh"
}
