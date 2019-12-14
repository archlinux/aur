# Maintainer: Giuseppe Sellaroli <g.sellaroli  at  yahoo  dot  it>
pkgname=scala-music
pkgver=2.44m
pkgrel=1
pkgdesc='Music software for experimentation with tunings and different kind of scales'
url='http://www.huygens-fokker.org/scala/'
arch=('x86_64')
source=("http://www.huygens-fokker.org/software/scala-22-pc64-linux.tar.bz2"
        "http://mirrors.kernel.org/ubuntu/pool/universe/g/gnat-4.9/libgnat-4.9_4.9.3-3ubuntu5_amd64.deb"
        "scala-music"
        "Scala.desktop"
        "scala-music.png")
optdepends=('gnuplot: to make graphic plots'
            'scala-music-scales: a collection of over 4800 scale files for Scala')
md5sums=('ca6b87159c5b8a5cb37096cffda6f5f0'
         '4a5be88fa48c52382b1da8e101d16d7d'
         'f9f67a3ae3037523db5e9bcd4b22fb99'
         'aed4e375f4acdd9d947a681c1deef49a'
         'c53cec9d2d767d86056752a1ed1f836a')
         
build () {
	tar -xf data.tar.xz
}

package() {
	
	
   
	install -dm755 "${pkgdir}/opt/scala/libs"

	cd "${srcdir}/scala-22-pc64-linux"

	for d in `find . -type d`
		do
				install -dm755  "${pkgdir}/opt/scala/$d"
		done
	   
		for f in `find . -type f`
		do
				install -m644 "$f" "${pkgdir}/opt/scala/$f"
		done
	
	install -m644 "libgtkada.so.2.24.4" "${pkgdir}/opt/scala/libs"	
	install -m644 "${srcdir}/usr/lib/x86_64-linux-gnu/"* "${pkgdir}/opt/scala/libs"

	install -dm755 "${pkgdir}/usr/bin"
	install -m755 "${srcdir}/scala-music" "${pkgdir}/usr/bin/scala-music"

	install -dm755 "${pkgdir}/usr/share/applications"
	install -m644 "${srcdir}/Scala.desktop" "${pkgdir}/usr/share/applications/Scala.desktop"

	install -dm755 "${pkgdir}/usr/share/pixmaps"
	install -m755 "${srcdir}/scala-music.png" "${pkgdir}/usr/share/pixmaps/Scala.png"

	chmod +x "${pkgdir}/opt/scala/scala"
}

