# Maintainer: taotieren <admin@taotieren.com>

pkgname=edrawmind-bin
_softname=mindmaster
_pkgname=EdrawMind-9
pkgver=9.0.10
pkgrel=1
arch=('x86_64')
options=(!strip)
conflicts=("edrawmind" "mindmaster" "mindmaster_cn" "mindmaster_en")
replaces=("mindmaster_en")
pkgdesc="Multi-functional, good-looking, easy-to-use professional mind mapping software"
license=('Commercial')
url="https://www.edrawsoft.com/download-mindmaster.html"
source_x86_64=("https://download.edrawsoft.com/archives/${pkgname%-bin}_${pkgver}_en_${arch}.deb")
sha256sums_x86_64=('3a5f7fa1d5402606a727a5a1fa06f0161b480b38e13f49b4856a41b8fc9c59d0')
            
prepare() {
    ar -x *.deb
	mkdir -p ${pkgname%-bin}
    tar -xf "${srcdir}/data.tar.xz" --xattrs-include='*' --numeric-owner -C "${pkgname%-bin}"
}

package() {	
    export LC_CTYPE="zh_CN.UTF-8"
    mv  ${srcdir}/${pkgname%-bin}/* ${pkgdir}
    
    install -dm755  "${pkgdir}/usr/share/pixmaps/" \
                    "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/" \
                    "${pkgdir}/usr/share/mime/packages/" \
                    "${pkgdir}/usr/share/applications/" \
                    "${pkgdir}/usr/bin/"
   
       install -Dm0644 /dev/stdin "${pkgdir}/opt/${_pkgname}/${pkgname%-bin}.desktop" << EOF
[Desktop Entry]
Name=${_pkgname%-9}
Name[en_US]=${pkgname%-bin}
Categories=Office;MindMap;Brainstorming;Mind;Map;
MimeType=application/x-emmx
Exec=${pkgname%-bin} %U
Terminal=false
Type=Application
Icon=${pkgname%-bin}.png
Encoding=UTF-8
Hidden=false
StartupNotify=false
X-Deepin-Vendor=EdrawSoft
Keywords=${_pkgname%-9};Mind;Brainstorming;Map;
Keywords[de]=${_pkgname%-9};MindMap;
Keywords[fr]=${_pkgname%-9};MindMap;
Keywords[ja]=${_pkgname%-9};MindMap;
Keywords[es]=${_pkgname%-9};Diagrama;
Keywords[zh_CN]=${_pkgname%-9};MindMap;
Keywords[zh_TW]=${_pkgname%-9};MindMap;
Comment=Mind Map Software
Comment[de]=mind map - software
Comment[fr]=Logiciel de carte
Comment[ja]=マインドマップソフト
Comment[es]=Mind Map Software
Comment[zh_CN]=思维导图软件
Comment[zh_TW]=心智圖軟件

EOF

    ln -sf "/opt/${_pkgname}/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    ln -sf "/opt/${_pkgname}/EdrawMind" "${pkgdir}/usr/bin/${pkgname%-bin}"
    ln -sf "/opt/${_pkgname}/${_softname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    ln -sf "/opt/${_pkgname}/emmx.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/emmx.svg"
    ln -sf "/opt/${_pkgname}/${_softname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}.xml"
}
