# Maintainer: Samleybrize <stephen.berquet at gmail dot com>

pkgname=kiki-re
pkgver=0.5.6
pkgrel=3
pkgdesc="Free environment for regular expression testing"
arch=('any')
url="http://kiki-re.googlecode.com/"
license=('GPL')
depends=('python2' 'wxpython2.8')
source=(
    https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/kiki-re/kiki-0.5.6-standalone.zip
    01_path_changes.diff
    02_remove_wx.NotebookSizer.diff
    kiki-re.desktop
    kiki.xpm
)
md5sums=(
    '59cb61d7983e729d1d1f9989e54ca968'
    '5721ec7105c89a7e2396bdc8e1f8e437'
    '15dafa53e96a1be6fb587139122f1287'
    'bfdcbbd6d0ee2f29d5760fa282b6e2c5'
    '1752595f00143ede3c4c9667175d261d'
)

prepare() {
    cd "${srcdir}"
    patch -p1 < 01_path_changes.diff
    patch -p1 < 02_remove_wx.NotebookSizer.diff
    sed -i '1i\
#!/usr/bin/env python2' kiki.py
}

package() {
    cd "${srcdir}"
    install -D -m 0755 kiki.py "${pkgdir}/usr/bin/kiki-re"
    install -D -m 0644 kiki.xpm "${pkgdir}/usr/share/pixmaps/kiki.xpm"
    install -D -m 0644 docs/about.html "${pkgdir}/usr/share/doc/kiki/about.html"
    install -D -m 0644 docs/index.html "${pkgdir}/usr/share/doc/kiki/index.html"
    install -D -m 0644 docs/re.html "${pkgdir}/usr/share/doc/kiki/re.html"
    install -D -m 0644 history.txt "${pkgdir}/usr/share/doc/kiki/history.txt"
    install -D -m 0644 readme.txt "${pkgdir}/usr/share/doc/kiki/readme.txt"
    install -D -m 0644 kiki-re.desktop "${pkgdir}/usr/share/applications/kiki-re.desktop"
}
