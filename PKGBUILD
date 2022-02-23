# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>

_app_name=lemmur
_file_name=com.krawieck.lemmur
pkgname="${_app_name}-bin"
pkgver=0.8.0
pkgrel=1
pkgdesc="A mobile client for lemmy"
arch=('x86_64')
url='https://github.com/LemmurOrg/lemmur'
license=('GPL2')
provides=('lemmur')
options=('!strip')
depends=('libblkid.so' 'xz' 'libgtk-3.so' 'libgdk-3.so' 'libpangocairo-1.0.so'
         'libpango-1.0.so' 'libharfbuzz.so' 'libatk-1.0.so' 'libgdk_pixbuf-2.0.so'
         'libgio-2.0.so' 'libgobject-2.0.so' 'gcc-libs' 'glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LemmurOrg/${_app_name}/releases/download/v${pkgver}/${_app_name}-v${pkgver}-x86_64-linux.tar.gz"
        "file:///${_file_name}.svg"
        "file:///${_file_name}.desktop"
        "file:///LICENSE")
sha256sums=('47bbd7cc7ad2c4f036cd26ba552d2a17c786f0e834d214bf4cb1ab2395ec2079'
            '7d496bfd62410ee75cc5869644e7cd7c3748dfdf6ff70ccbe5e1d44ab32938fd'
            '3b40f6cd34a84161c76bc53a31d57b4538f67ca4a1d7d21546fac7a22f40ae2f'
            '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643')

package() {
    local opt_dir="/opt/${pkgname}"

    install -Dm644 "${_file_name}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${_app_name}"

    install -d "${pkgdir}${opt_dir}" "${pkgdir}/usr/bin"

    mv {data,lib,"${_app_name}"} "${pkgdir}${opt_dir}"

    ln -s "${opt_dir}/${_app_name}" "${pkgdir}/usr/bin"

    install -Dm644 "${_file_name}.desktop" -t "${pkgdir}/usr/share/applications"
}
