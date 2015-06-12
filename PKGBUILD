# Maintainer: Lara Maia <lara@craft.net.br>
DLAGENTS=('http::/usr/bin/curl -e "http://www.geeks3d.com/20131028/gputest-0-6-0-opengl-benchmark-for-windows-mac-os-x-and-linux-downloads/" -fLC - --retry 3 --retry-delay 3 -o %o %u')

pkgname=glslhacker
pkgdesc="A free cross-platform demotool for creating demos."
url='http://www.geeks3d.com/glslhacker/'
license="custom"
pkgver=0.8.0.0
pkgrel=2

arch=('x86_64');
source=('http://www.ozone3d.net/glslhacker/dl/GLSLHacker_DEV_linux64.zip')
md5sums=('983cbd359cb56c696d40d2011b3deec0')

makedepends=('unzip')

depends=('fmodex'
         'ffmpeg-compat-55'
         'ffmpeg-compat'
         'freeimage'
         'glu')

package() {
    cd "GLSLHacker_DEV_linux($pkgver)/"

    install -Dm644 EULA.txt "$pkgdir"/usr/share/licenses/$pkgname/EULA.txt

    install -dm755 "$pkgdir"/opt/$pkgname/
    cp -rf libs/ "$pkgdir"/opt/$pkgname/
    install -Dm644 libPhys* "$pkgdir"/opt/$pkgname/
    install -Dm755 libgxl* "$pkgdir"/opt/$pkgname/
    install -Dm755 plugin* "$pkgdir"/opt/$pkgname/
    install -Dm644 init0.xml "$pkgdir"/opt/$pkgname/
    install -Dm644 conf.xml "$pkgdir"/opt/$pkgname/
    install -Dm755 GLSLHacker "$pkgdir"/opt/$pkgname/

    install -dm755 "$pkgdir"/usr/bin/
    echo -e "#!/usr/bin/bash\ncd \"/opt/$pkgname/\"\n./GLSLHacker \$@" > "$pkgdir"/usr/bin/glslhacker
    echo -e "#!/usr/bin/bash\nglslhacker /demofile=\\\"\$(realpath \$1)\\\"" > "$pkgdir"/usr/bin/glsl-loader
    chmod -R 755 "$pkgdir"/usr/bin/glslhacker*
}
