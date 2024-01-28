pkgname=fzf-tab-source
pkgver=r6.05c1fc5
pkgrel=1
pkgdesc="替代zsh的命令补全功能，加入文件和目录预览，可使用rg和rga辅助fzf搜索。
         Replace zsh's default completion selection menu with fzf.Add file and directory previews,and can use rg or rga to assist fzf searches.
         After the installation is completed, use 'fts -a' to enable the plugin"
arch=('x86_64')
url="https://github.com/aslingguang/fzf-tab-source"
license=('GPL')
depends=('zsh' 'fzf')
makedepends=('git')
conflicts=('fzf-tab-git' 'fzf-tab-bin-git' )
optdepends=('exa: 目录结构预览'
	'chafa: 图片预览'
	'perl-image-exiftool: 元数据预览'
	'python-pdftotext: pdf预览'
	'bat: 文本预览'
	'python-xlsx2csv: xlsx2csv预览'
	'perl-xls2csv: xls2csv预览'
	'csvkit: xlsx2csv和xls2csv预览'
	'pandoc: docx预览'
	'atool: deb,gz,jar,rpm,tar,tgz,xz,zip等预览 '
	'unrar: rar预览'
	'p7zip: 7z预览'
	'fd: 快速查找文件和目录，比默认的find更快')
source=("git+https://github.com/aslingguang/fzf-tab-source.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$pkgname"
	install -dm755 "${pkgdir}/usr/share/zsh/plugins/${pkgname}"
	cp -dr --no-preserve=ownership {fzf-tab.zsh,lib,modules} \
	"${pkgdir}/usr/share/zsh/plugins/${pkgname}"
	ln -s "fzf-tab.zsh" \
	"${pkgdir}/usr/share/zsh/plugins/${pkgname}/fzf-tab.plugin.zsh"
}
