# Maintainer: abcfy2 <abcfy2@163.com>

pkgname=('deepin-wine5' 'deepin-wine5-i386' 'deepin-wine5-tools')
pkgver=5.0.11
pkgrel=1
pkgdesc="Deepin Wine5"
arch=('i686' 'x86_64')
url="http://www.deepin.org"
license=('Proprietary')
makedepends=('tar')
source=(
    "https://community-packages.deepin.com/deepin/pool/main/d/deepin-wine5/deepin-wine5_${pkgver}-${pkgrel}_i386.deb"
    "https://community-packages.deepin.com/deepin/pool/main/d/deepin-wine5/deepin-wine5-i386_${pkgver}-${pkgrel}_i386.deb"
    "https://community-packages.deepin.com/deepin/pool/main/d/deepin-wine5/deepin-wine5-tools_${pkgver}-${pkgrel}_i386.deb"
)
noextract=(
    "deepin-wine5_${pkgver}-${pkgrel}_i386.deb"
    "deepin-wine5-i386_${pkgver}-${pkgrel}_i386.deb"
    "deepin-wine5-tools_${pkgver}-${pkgrel}_i386.deb"
)
md5sums=(
    '7eac8b1924331c6204754a32b4955242'
    '03f6b8554645fbdd59a3cf81ed1d8354'
    '834f320cff9a4a17f3a262a2d406407c'
)

package_deepin-wine5() {
    depends=('deepin-wine5-i386')

    mkdir -p "deepin-wine5_${pkgver}-${pkgrel}"
    ar -x "deepin-wine5_${pkgver}-${pkgrel}_i386.deb" data.tar.xz --output "deepin-wine5_${pkgver}-${pkgrel}"
    tar -xf "deepin-wine5_${pkgver}-${pkgrel}/data.tar.xz" --directory="deepin-wine5_${pkgver}-${pkgrel}"
    rm -f "deepin-wine5_${pkgver}-${pkgrel}/data.tar.xz"
    # Removed conflict files with wine
    rm -fr "deepin-wine5_${pkgver}-${pkgrel}/usr/share/man"
    cp -r "deepin-wine5_${pkgver}-${pkgrel}/." "${pkgdir}/"
}

package_deepin-wine5-i386() {
    # deepin-wine5-i386 deb dependencies (Note: i386):
    # Depends: libasound2 (>= 1.0.16), libc6 (>= 2.28), libglib2.0-0 (>= 2.12.0),
    #          libgphoto2-6 (>= 2.5.10), libgphoto2-port12 (>= 2.5.10),
    #          libgstreamer-plugins-base1.0-0 (>= 1.0.0), libgstreamer1.0-0 (>= 1.4.0),
    #          liblcms2-2 (>= 2.2+git20110628), libldap-2.4-2 (>= 2.4.7), libmpg123-0 (>= 1.13.7),
    #          libopenal1 (>= 1.14), libpcap0.8 (>= 0.9.8), libpulse0 (>= 0.99.1),
    #          libudev1 (>= 183), libusb-1.0-0 (>= 2:1.0.16), libx11-6, libxext6,
    #          libxml2 (>= 2.9.0), ocl-icd-libopencl1 | libopencl1, udis86, zlib1g (>= 1:1.1.4),
    #          libasound2-plugins, libncurses6 | libncurses5 | libncurses
    # Recommends: libcapi20-3, libcups2, libdbus-1-3, libfontconfig1, libfreetype6,
    #             libglu1-mesa | libglu1, libgnutls30 | libgnutls28 | libgnutls26,
    #             libgsm1, libgssapi-krb5-2, libjpeg62-turbo | libjpeg8, libkrb5-3,
    #             libodbc1, libosmesa6, libpng16-16 | libpng12-0, libsane | libsane1,
    #             libsdl2-2.0-0, libtiff5, libv4l-0, libxcomposite1, libxcursor1,
    #             libxfixes3, libxi6, libxinerama1, libxrandr2, libxrender1, libxslt1.1, libxxf86vm1
    depends=(
        'lib32-alsa-plugins' 'lib32-glib2' 'lib32-glibc' 'libgphoto2'
        'lib32-gst-plugins-base-libs' 'lib32-lcms2' 'lib32-libldap' 'lib32-mpg123'
        'lib32-openal' 'lib32-libpcap' 'lib32-libcanberra-pulse' 'lib32-libudev0-shim'
        'lib32-libusb' 'lib32-libx11' 'lib32-libxext' 'lib32-libxml2' 'lib32-ocl-icd'
        'deepin-udis86' 'lib32-zlib' 'lib32-ncurses' 'lib32-fontconfig' 'lib32-freetype2'
        'lib32-gettext' 'lib32-libxcursor' 'lib32-mesa' 'lib32-libjpeg6' 'lib32-libxrandr'
        'lib32-libxi' 'lib32-glu'
    )

    mkdir -p "deepin-wine5-i386_${pkgver}-${pkgrel}"
    ar -x "deepin-wine5-i386_${pkgver}-${pkgrel}_i386.deb" data.tar.xz --output "deepin-wine5-i386_${pkgver}-${pkgrel}"
    tar -xf "deepin-wine5-i386_${pkgver}-${pkgrel}/data.tar.xz" --directory="deepin-wine5-i386_${pkgver}-${pkgrel}"
    rm -f "deepin-wine5-i386_${pkgver}-${pkgrel}/data.tar.xz"
    # Rename conflict files with deepin-wine
    mv -f "deepin-wine5-i386_${pkgver}-${pkgrel}/usr/bin/deepin-winegcc32" "deepin-wine5-i386_${pkgver}-${pkgrel}/usr/bin/deepin-wine5gcc32"
    # Removed conflict files with wine
    rm -fr "deepin-wine5-i386_${pkgver}-${pkgrel}/usr/share/man"
    cp -r "deepin-wine5-i386_${pkgver}-${pkgrel}/." "${pkgdir}/"
}

package_deepin-wine5-tools() {
    depends=('deepin-wine5')
    conflicts=('wine')

    mkdir -p "deepin-wine5-tools_${pkgver}-${pkgrel}"
    ar -x "deepin-wine5-tools_${pkgver}-${pkgrel}_i386.deb" data.tar.xz --output "deepin-wine5-tools_${pkgver}-${pkgrel}"
    tar -xf "deepin-wine5-tools_${pkgver}-${pkgrel}/data.tar.xz" --directory="deepin-wine5-tools_${pkgver}-${pkgrel}"
    rm -f "deepin-wine5-tools_${pkgver}-${pkgrel}/data.tar.xz"
    # Removed conflict files with wine
    rm -fr "deepin-wine5-tools_${pkgver}-${pkgrel}/usr/share/man"
    cp -r "deepin-wine5-tools_${pkgver}-${pkgrel}/." "${pkgdir}/"
}
