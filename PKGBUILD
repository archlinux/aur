# Maintainer: Direct-A <songyicheng0@gmail.com>

pkgname="rime-pure-git-direct"
pkgver="1.2.0"
pkgrel=1
pkgdesc="一站式配置【四叶草拼音\小鹤双拼】，更新搜狗词库"
arch=("x86_64")
url="https://github.com/Direct-A/rime-pure"
license=("MIT")
makedepends=("git")
optdepends=("rime-prelude" "rime-emoji" "rime-symbols")
conflicts=("rime-cloverpinyin")
source=("git+${url}"
        "$pkgname.install")
sha256sums=('SKIP'
            '25ac17d4834b51696f859a3a06673a6a47970a02f51c80625ab3fa1b6c390f15')

install=${pkgname}.install

prepare() {
  echo -e "\033[1;34m######################################\033[0m"
  echo -e "\033[1;34m#    prepare for following install   #\033[0m"
  echo -e "\033[1;34m######################################\033[0m"

  F_LIST=("default.yaml" "rime.lua" "essay.txt" "punctuation.yaml" "key_bindings.yaml" \
flypy_{sys,top,user}.txt flypy.{custom,schema}.yaml \
clover.{base.dict,dict,key_bindings,schema}.yaml \
build/flypy.{prism,reverse,table}.bin \
opencc/{emoji_category.txt,HKVariants.txt,s2tw.json,t2hk.json,tw2sp.json,\
TWVariantsRevPhrases.txt,emoji.json,jp2t.json,s2twp.json,t2jp.json,tw2t.json,\
TWVariantsRev.txt,emoji_word.txt,JPShinjitaiCharacters.txt,STCharacters.txt,\
t2s.json,TWPhrasesIT.txt,TWVariants.txt,hk2s.json,JPShinjitaiPhrases.txt,\
STPhrases.txt,t2tw.json,TWPhrasesName.txt,hk2t.json,JPVariants.txt,\
symbol_category.txt,TSCharacters.txt,TWPhrasesOther.txt,HKVariantsRevPhrases.txt,\
s2hk.json,symbol.json,TSPhrases.txt,TWPhrasesRev.txt,HKVariantsRev.txt,s2t.json,\
symbol_word.txt,tw2s.json,TWPhrases.txt} \
THUOCL_{animal,caijing,car,chengyu,diming,food,IT,law,lishimingren,medical,poem}.dict.yaml \
"sogou_new_words.dict.yaml" "huayu.dict.yaml" "symbols.yaml"
)
  for f in ${F_LIST[*]}; do
    f_path="/usr/share/rime-data/${f}"
    [[ -f ${f_path} ]] && sudo -S rm -r ${f_path} && echo -e "\033[1;31m => removing \"${f_path}\"\033[0m"
  done
  return 0
}

package() {
  cd ${srcdir}/${pkgname%-git*}/target/

  # 基础文件
  install -Dm644 rime.lua -t "$pkgdir"/usr/share/rime-data
  install -Dm644 essay.txt -t "$pkgdir"/usr/share/rime-data
  install -Dm644 default.yaml -t "$pkgdir"/usr/share/rime-data
  install -Dm644 punctuator.yaml -t "$pkgdir"/usr/share/rime-data
  install -Dm644 key_bindings.yaml -t "$pkgdir"/usr/share/rime-data
  install -Dm644 ../LICENSE -t "$pkgdir"/usr/share/licenses/rime-pure-git-direct
  # 小鹤音形
  install -Dm644 build/flypy.{prism,reverse,table}.bin -t "$pkgdir"/usr/share/rime-data/build
  install -Dm644 flypy.{custom,schema}.yaml -t "$pkgdir"/usr/share/rime-data
  install -Dm644 flypy_{sys,top,user}.txt -t "$pkgdir"/usr/share/rime-data
  # clover
  install -Dm644 opencc/* -t "$pkgdir"/usr/share/rime-data/opencc
  install -Dm644 clover.{base.dict,dict,key_bindings,schema}.yaml -t "$pkgdir"/usr/share/rime-data
  install -Dm644 THUOCL_{animal,caijing,car,chengyu,diming,\
food,IT,law,lishimingren,medical,poem}.dict.yaml -t "$pkgdir"/usr/share/rime-data
  install -Dm644 {sogou_new_words,huayu,zhwiki}.dict.yaml -t "$pkgdir"/usr/share/rime-data
}
