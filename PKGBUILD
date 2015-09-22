# Mantainer: Kozec (kozec2 <at> kozec <dot> com)

pkgname=google2srt
pkgver=0.7
pkgrel=1
pkgdesc="Google2SRT allows you to convert subtitles from Google Video and YouTube to SubRip (.srt) format."
arch=('i686' 'x86_64')
url=(http://sourceforge.net/projects/google2srt/)
license=('GPL3')
depends=('java-runtime' 'java-jdom1' 'java-commons-io')
makedepends=('unzip' 'java-environment')
source=("http://heanet.dl.sourceforge.net/project/google2srt/Google2SRT/${pkgver}/Google2SRT-${pkgver}.zip"
		google2srt
		google2srt.desktop
		icon.png
		)

build() {
	cd "${srcdir}/Google2SRT-${pkgver}/src"
	CLASSPATH="/usr/share/java/jdom/jdom.jar"
	CLASSPATH="$CLASSPATH:/usr/share/java/commons-io/commons-io.jar"
	CLASSPATH="$CLASSPATH:/usr/share/java/saxon/saxon.jar"
	CLASSPATH="$CLASSPATH" javac *.java
}

package() {
	mkdir -p "$pkgdir/usr/share/doc/google2srt"
	mkdir -p "$pkgdir/usr/lib/google2srt"
	mkdir -p "$pkgdir/usr/share/google2srt"
	mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/share/icons"
	mkdir -p "$pkgdir/usr/bin"
	cd "${srcdir}"
	install -m0755 google2srt "$pkgdir/usr/bin" || return 1
	install -m0644 google2srt.desktop "$pkgdir/usr/share/applications" || return 1
	install -m0644 icon.png "$pkgdir/usr/share/icons/google2srt.png" || return 1
	cd "${srcdir}/Google2SRT-${pkgver}/src"
	for i in *.class ; do
		install -m0644 $i "$pkgdir/usr/lib/google2srt/$i" || return 1
	done
	for i in Bundle* *.form *.jpg *.png ; do
		install -m0644 $i "$pkgdir/usr/share/google2srt/$i" || return 1
	done
}

md5sums=('7aa6575552f949e737c776d68968816c'
         '51010acfab296d7998a6885a0b30dee7'
         '06c19e48725df1476945d73cb28744ce'
         '7878c439c81412767874bfbf6c6683ad')
